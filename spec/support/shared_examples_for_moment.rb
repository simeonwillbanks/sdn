# encoding: utf-8
shared_examples_for "a type of moment" do
  it { should have_many(:moments) }
  it { should have_many(:comments) }
  it "can have tags applied" do
    model.update_attributes(:tag_list => "hello, tags")
    model.tags.size.should == 2
  end
  it "and the tags are included in the json representation" do
    model.as_json.keys.should include :tags
  end
  it "also the json representation can be customized with options" do
    keys = model.as_json(:exclude => [:created_at, :id]).keys
    keys.should include :tags
    keys.should_not include [:created_at, :id]
  end
  it "is a Moment" do
    model.moments.size.should == 1
  end
  it "and the Moment is the correct type" do
    model.moments.first.subject_type.should == type
  end
  it "on subsequent save, it still has a single Moment" do
    model.update_attributes(:updated_at => 2.days.ago)
    model.moments.size.should == 1
  end
end
