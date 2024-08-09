require 'rails_helper'

RSpec.describe Note do
  describe "validations" do
    context "presence" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:content) }
    end

    context "length characters for content" do
      context "when is valid" do
        let(:valid_note) do
          create(:note, content: "content valid")
        end

        it "is valid when content has 10 or more characters" do
          expect(valid_note).to be_valid
        end
      end

      context "when is invalid" do
        let(:invalid_note) do
          build(:note, content: "invalid")
        end

        let(:errors_details) do
          {
            content:[
              {
                error: :too_short,
                count: 10
              }
            ]
           }
        end

        before do
          invalid_note.valid?
        end

        it "is invalid when content has less than 10 characters" do
          expect(invalid_note.errors.details).to eq(errors_details)
        end
      end
    end
  end
end
