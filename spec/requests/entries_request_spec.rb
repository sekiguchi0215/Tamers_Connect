require "rails_helper"

RSpec.describe "Entries", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "POST #create" do
    let(:new_recruitment) { create(:recruitment, user_id: user.id) }
    let(:recruitment_id) { new_recruitment.id }
    subject { post(recruitment_entries_path(recruitment_id), xhr: true) }

    context "パラメータが正常なとき", js: true do
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "entry できる" do
        expect { subject }.to change { Entry.count }.by(1)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:recruitment) { create(:recruitment, user_id: user.id) }
    before do
      create(:entry, user_id: user.id, recruitment_id: recruitment.id)
    end
    subject { delete(recruitment_entries_path(recruitment.id), xhr: true) }

    context "パラメータが正常なとき" do
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "entry が削除される" do
        expect { subject }.to change(Entry, :count).by(-1)
      end
    end
  end
end
