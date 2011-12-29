# encoding: utf-8
class MomentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :columns, :type => :hash, :default => {}

  def create
    resource
    decorator
    partial
  end

  def edit
    route
    resource_controller
    resource_model
    comments_controller
    features
  end

  private 

  def resource
    args = [capital_name]
    args << columns.inject('') { |opts, col| opts << " #{col[0]}:#{col[1]}" } unless columns.empty?
    args << "--no-assets --no-view-specs --no-helper"
    generate "resource", args.join(" ")
  end

  def decorator
    generate "draper:decorator", capital_name
  end

  def route
    gsub_file 'config/routes.rb', /(resources :#{plural_name}\n)/, ''
    gsub_file 'config/routes.rb', /( :only => \[:index)/, " :#{plural_name},\\1"
  end

  def resource_model
    gsub_file "app/models/#{singular_name}.rb", /ActiveRecord::Base/, "DefaultScope\n\tinclude Momentable"
    gsub_file "spec/models/#{singular_name}_spec.rb", /do.*/m, <<-SPEC
do
  before { Factory(:#{singular_name}) }
  context 'validations' do

  end

  let(:type) { '#{capital_name}' }
  let(:model) { Factory(:#{singular_name}) }
  it_behaves_like 'a type of moment'
end
    SPEC
  end

  def resource_controller
    gsub_file "app/controllers/#{plural_name}_controller.rb", /ApplicationController/, "InheritedResources::Base\n\tinclude MomentsApi"
    gsub_file "spec/controllers/#{plural_name}_controller_spec.rb", /do.*/m, <<-SPEC
do
  let(:moment) { :#{singular_name} }
  include_context 'moment'
end
    SPEC
  end

  def partial
    copy_file "partial.html.haml", "app/views/#{plural_name}/_#{singular_name}.html.haml"
  end

  def comments_controller
    insert_into_file "app/controllers/comments_controller.rb", :after => "belongs_to :post, :polymorphic => true\n" do
      "\tbelongs_to :#{singular_name}, :polymorphic => true\n"
    end
  end

  def features 
    insert_into_file "features/moments_display.feature", :after => example_header(['moment']) do
      # Name must be plural incase pluralization is abnormal
      example_row [plural_name]
    end
    %w(home_page moments_display moment_creation).each do |f|
      insert_into_file "features/#{f}.feature", :after => example_header(['moment','attribute','value']) do
        example_row [singular_name, moment_attribute, sentence]
      end
    end
    %w(moment_comments moment_creation).each do |f|
      insert_into_file "features/#{f}.feature", :after => example_header(['moment']) do 
        example_row [singular_name]
      end
    end
    insert_into_file "features/moment_tags.feature", :after => example_header(['moment','attribute','value', 'tags']) do
      example_row [singular_name, moment_attribute, sentence, "#{word}, #{word}"]
    end
  end

  def example_header(columns)
    "| #{columns.join(' | ')} |\n"
  end

  def example_row(columns)
    "\t\t\t#{example_header(columns)}"
  end

  def capital_name
    @capital_name ||= singular_name.capitalize
  end

  def moment_attribute
    @moment_attribute ||= columns.first.first
  end

  def sentence
    Forgery(:lorem_ipsum).sentence(:random => true)
  end

  def word
    Forgery(:lorem_ipsum).word(:random => true)
  end

end
