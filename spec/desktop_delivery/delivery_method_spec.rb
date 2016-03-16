require "spec_helper"

describe DesktopDelivery::DeliveryMethod do
  subject {
    DesktopDelivery::DeliveryMethod
  }

  let(:raw_mail) {
    File.read(__FILE__).split("__END__").last.strip
  }

  let(:mail) {
    Mail.new(raw_mail)
  }

  let(:instance) {
    expect(Launchy).to receive(:open)
    instance = subject.new
    instance.deliver!(mail)
    instance
  }

  before do
    Timecop.freeze "2015-06-15 15:30:00"
  end

  it "default use system tmp path" do
    path = subject.new.send(:path)
    expect(path).to_not be nil
    expect(File.exists? path).to be true
  end

  it "use specified path" do
    path = subject.new(path: "/a/b/c").send(:path)
    expect(path).to eq "/a/b/c"
  end

  it "create tmp path" do
    expect_any_instance_of(subject).to receive(:create_file!)
    expect_any_instance_of(subject).to receive(:open_file!)
    expect(FileUtils).to receive(:mkpath).with("/a/b/c")
    instance = subject.new(path: "/a/b/c").deliver!(mail)
  end

  it "generates a file_name" do
    expect(instance.send :file_name).to eq "2015-06-15_15-30-00_000_I-am-the-subject.eml"
  end

  it "create a file" do
    file_path = instance.send(:file_path)
    expect(File.exists? file_path).to be true

    file_content = File.read file_path
    expect(file_content).to include "I am the subject!!"
    expect(file_content).to include "I am the body."
  end

  it "open created file" do
    expect_any_instance_of(subject).to receive(:create_path!)
    expect_any_instance_of(subject).to receive(:create_file!)
    expect(Launchy).to receive(:open).with("/a/b/c/2015-06-15_15-30-00_000_I-am-the-subject.eml")
    instance = subject.new(path: "/a/b/c").deliver!(mail)
  end

end

__END__

Date: Wed, 16 Mar 2016 19:12:10 +0100
From: from@example.org
To: to@example.com
Subject: I am the subject!!

I am the body.
