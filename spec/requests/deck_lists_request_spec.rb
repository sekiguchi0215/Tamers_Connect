require "rails_helper"

RSpec.describe "DeckLists", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "GET #index" do
    subject { get(deck_lists_path) }

    context "デッキリストが存在するとき" do
      let!(:deck_list) { create(:deck_list, user_id: user.id) }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "deck_list が表示されている" do
        subject
        expect(response.body).to include deck_list.deck_list.url
      end
    end
  end

  describe "GET #show" do
    subject { get(deck_list_path(deck_list.id)) }

    context "デッキリストが存在するとき" do
      let(:deck_list) { create(:deck_list, user_id: user.id) }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "deck_list が表示されている" do
        subject
        expect(response.body).to include deck_list.deck_list.url
      end
    end
  end

  describe "GET #new" do
    subject { get(new_deck_list_path) }

    it "リクエストが成功する" do
      subject
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    subject { post(deck_lists_path, params: params) }

    context "パラメータが正常なとき" do
      let(:params) { { deck_list: attributes_for(:deck_list) } }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(302)
      end

      it "投稿が保存される" do
        expect { subject }.to change { DeckList.count }.by(1)
      end

      it "デッキリスト一覧ページにリダイレクトされる" do
        subject
        expect(response).to redirect_to("http://www.example.com/deck_lists")
      end
    end

    context "パラメータが異常なとき" do
      let(:params) { { deck_list: attributes_for(:deck_list, :invalid) } }

      it "リクエストが成功するとき" do
        subject
        expect(response).to have_http_status(200)
      end

      it "投稿が保存されない" do
        expect { subject }.not_to change(DeckList, :count)
      end

      it "イベント投稿ページがレンダリングされる" do
        subject
        expect(response.body).to include "デッキ登録"
      end
    end
  end

  describe "GET #edit" do
    subject { get(edit_deck_list_path(deck_list_id)) }

    context "デッキリストが存在するとき" do
      let(:deck_list) { create(:deck_list, user_id: user.id) }
      let(:deck_list_id) { deck_list.id }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "deck_list が表示されている" do
        subject
        expect(response.body).to include deck_list.deck_list.url
      end
    end
  end

  describe "PATCH #update" do
    subject { patch(deck_list_path(deck_list.id), params: params) }
    let(:deck_list) { create(:deck_list, user_id: user.id) }

    context "パラメータが正常なとき" do
      let(:params) { { deck_list: attributes_for(:deck_list) } }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(302)
      end

      it "content が更新される" do
        content = deck_list.content
        new_content = params[:deck_list][:content]
        expect { subject }.to change { deck_list.reload.content }.from(content).to(new_content)
      end
    end

    context "パラメータが異常なとき" do
      let(:params) { { deck_list: attributes_for(:deck_list, :invalid) } }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "status が更新されない" do
        expect { subject }.not_to change(deck_list.reload, :status)
      end

      it "編集ページがレンダリングされる" do
        subject
        expect(response.body).to include "編集中..."
      end
    end
  end

  describe "DELETE #destroy" do
    subject { delete(deck_list_path(deck_list.id)) }
    let!(:deck_list) { create(:deck_list, user_id: user.id) }

    context "パラメータが正常なとき" do
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(302)
      end

      it "デッキリストが削除される" do
        expect { subject }.to change(DeckList, :count).by(-1)
      end

      it "イベント一覧にリダイレクトすること" do
        subject
        expect(response).to redirect_to("http://www.example.com/deck_lists")
      end
    end
  end
end
