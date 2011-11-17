shared_examples_for "index presenter" do

  describe ".index" do
    it "paginates index collection" do
      model.should_receive(:page).with(1)
      subject.index :page => 1
    end
  end

end
