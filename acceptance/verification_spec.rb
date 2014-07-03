require 'rexml/document'
require 'ci/reporter/test_utils/accessor'
require 'ci/reporter/test_utils/shared_examples'
require 'rspec/collection_matchers'

REPORTS_DIR = File.dirname(__FILE__) + '/reports'

describe "Test::Unit acceptance" do
  include CI::Reporter::TestUtils::SharedExamples
  Accessor = CI::Reporter::TestUtils::Accessor

  let(:report_path1) { File.join(REPORTS_DIR, 'TEST-TestUnitExampleTestOne.xml') }
  let(:report_path2) { File.join(REPORTS_DIR, 'TEST-TestUnitExampleTestTwo.xml') }

  context "the first example" do
    subject(:result) { Accessor.new(load_xml_result(report_path1)) }

    it { is_expected.to have(1).errors }
    it { is_expected.to have(1).failures }
    it { is_expected.to have(1).testcases }

    describe "the assertion count" do
      subject { result.assertions_count }
      it { is_expected.to eql 1 }
    end

    it "captures the STDOUT" do
      expect(result.system_out).to eql "Some <![CDATA[on stdout]]>"
    end

    it_behaves_like "a report with consistent attribute counts"
  end

  context "the second example" do
    subject(:result) { Accessor.new(load_xml_result(report_path2)) }

    it { is_expected.to have(0).errors }
    it { is_expected.to have(0).failures }
    it { is_expected.to have(1).testcases }

    describe "the assertion count" do
      subject { result.assertions_count }
      it { is_expected.to eql 1 }
    end

    it_behaves_like "a report with consistent attribute counts"
    it_behaves_like "nothing was output"
  end

  def load_xml_result(path)
    File.open(path) do |f|
      REXML::Document.new(f)
    end
  end
end
