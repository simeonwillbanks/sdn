class MomentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :columns, :type => :hash, :default => {}

  def resource
    args = [capital_name]
    args << columns.inject('') { |opts, col| opts << " #{col[0]}:#{col[1]}" } unless columns.empty?
    args << "--no-assets --no-view-specs --no-helper"
    generate "resource", args.join(" ")
  end

  def decorator
    generate "draper:decorator", capital_name
  end

  def rewrite_route
    gsub_file 'config/routes.rb', /(resources :#{plural_name}\n)/, ''
    gsub_file 'config/routes.rb', /( :only => \[:index)/, " :#{plural_name},\\1"
  end

  def rewrite_model
    gsub_file "app/models/#{singular_name}.rb", /ActiveRecord::Base/, "DefaultScope\n\tinclude Momentable"
    gsub_file "spec/models/#{singular_name}_spec.rb", /pending "add some examples to \(or delete\) \#\{__FILE__\}"/, "context 'validations' do\n\n\tend\n\n\tlet(:type) { '#{capital_name}' }\n\tlet(:model) { Factory(:#{singular_name}) }\n\tit_behaves_like 'a type of moment'"
  end

  def rewrite_controller
    gsub_file "app/controllers/#{plural_name}_controller.rb", /ApplicationController/, "InheritedResources::Base\n\tinclude MomentsApi"
    gsub_file "spec/controllers/#{plural_name}_controller_spec.rb", /do\n/, "do\n\tlet(:moment) { :#{singular_name} }\n\tinclude_context 'moment'"
  end

  def touch_partial
    copy_file "partial.html.haml", "app/views/#{plural_name}/_#{singular_name}.html.haml"
  end

  def edit_comments_controller
    gsub_file "app/controllers/comments_controller.rb", /(belongs_to :post, :polymorphic => true\n)/, "\\1\tbelongs_to :#{singular_name}, :ploymorphic => true\n"
  end

  def add_examples
    gsub_file "features/home_page.feature", /(\| moment    \| attribute   \| value               \|\n)/, "\\1\t\t\t| #{singular_name} | #{moment_attribute} | #{dummy_text} |\n"
    gsub_file "features/moment_comments.feature", /(\| moment    \|\n)/, "\\1\t\t\t| #{singular_name} |\n"
    gsub_file "features/moments_display.feature", /(\| moment    \| attribute   \| value               \|\n)/, "\\1\t\t\t| #{singular_name} | #{moment_attribute} | #{dummy_text} |\n"
    gsub_file "features/moment_creation.feature", /(\| moment    \| attribute   \| value               \|\n)/, "\\1\t\t\t| #{singular_name} | #{moment_attribute} | #{dummy_text} |\n"
    gsub_file "features/moment_creation.feature", /(\| moment    \|\n)/, "\\1\t\t\t| #{singular_name} |\n"
    gsub_file "features/moment_tags.feature", /(\| moment    \| attribute   \| value               \| tags            \|\n)/, "\\1\t\t\t| #{singular_name} | #{moment_attribute} | #{dummy_text} | #{dummy_text}, #{dummy_text} |\n"
  end

  private

  def capital_name
    @capital_name ||= singluar_name.capitalize
  end

  def moment_attribute
    columns.first.first
  end

  def dummy_text
    Forgery(:basic).text
  end

end
