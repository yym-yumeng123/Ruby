require 'rails_helper'

RSpec.describe "Tags", type: :request do
  context 'create' do
    it "should not create a tag before sign in" do
      post '/tags', params: {name: '饮食'}
      expect(response.status).to eq 401
    end

    it "should create a tag after sign in" do
      sign_in
      post '/tags', params: {name: '饮食'}
      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      expect(body['resource']['id']).to be
    end

    it "should not create a tag without name" do
      sign_in
      post '/tags'
      expect(response.status).to eq 422
      body = JSON.parse(response.body)
      expect(body['errors']['name'][0]).to eq '标签名不能为空'
    end
  end

  context 'destroy' do
    it 'should not destroy a tag before sign in' do
      # ! 意思是报错就终止
      tag = Tag.create! name: 'test'
      delete "/tags/#{tag.id}"
      expect(response.status).to eq 401
    end

    it 'should destroy a tag' do
      sign_in
      tag = Tag.create! name: 'test'
      delete "/tags/#{tag.id}"
      expect(response.status).to eq 200
    end
  end
end
