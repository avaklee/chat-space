require 'rails_helper'
RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }

# メッセージ一覧ページを表示するアクション
  # ログインしている場合
  describe 'GET #index' do
    before do
      login_user user
      create_list(:group, 3, user_ids: [user.id])
      @group = user.groups.first
    end
    it "populates an array of messages, アクション内で定義しているインスタンス変数があるか" do
      messages = create_list(:message, 3, group_id: @group.id)
      get :index, params: { group_id: @group.id }
      expect(assigns(:messages)).to match(messages)
    end
    it "renders the :index template" do
      get :index, params: {group_id: @group.id}
      expect(response).to render_template :index
    end
  end
  # ログインしていない場合
  describe 'GET #index' do
    it "redirect to signin page if user is not signed in" do
      create_list(:group, 3, user_ids: [user.id])
      @group = user.groups.first
      get :index, params: {group_id: @group.id}
      expect(response).to redirect_to(new_user_session_path)
    end
  end
# メッセージを作成するアクション
  # ログインしているかつ、保存に成功した場
  describe 'POST #create' do
    before do
      login_user user
      create_list(:group, 3, user_ids: [user.id])
      @group = user.groups.first
    end
    it "assigns a newly created and saved item as @message" do
      expect{
      post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: @group.id }}.to change(Message, :count).by(1)
    end
    it "renders the :index template" do
      get :index, params: {group_id: @group.id}
      expect(response).to render_template :index
    end
  # ログインしているが、保存に失敗した場合
    it "assigns a newly created but unsaved item as @message" do
      expect{
      post :create, params: { message: attributes_for(:message, { body: nil, image: nil }), group_id: @group.id }}.to change(Message, :count).by(0)
    end

    it "assigns @message" do
      post :create, params: { message: { body: "", image: nil }, group_id: group.id, user_id: user.id }
      expect(assigns(:message)).to be_a_new(Message)
    end
    it "shows flash message" do
      post :create, params: { message: { body: "", image: nil }, group_id: group.id, user_id: user.id }
      expect(flash[:alert]).to be_present
    end

    it "renders the :index template" do
      get :index, params: {group_id: @group.id}
      expect(response).to render_template :index
    end
  end
  #ログインしていない場合
  describe 'POST #create' do
    it "redirect to signin page if user is not signed in" do
      create_list(:group, 3, user_ids: [user.id])
      @group = user.groups.first
      get :index, params: {group_id: @group.id}
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
