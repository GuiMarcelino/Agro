require 'rails_helper'

RSpec.describe "Notes", type: :request do
  let!(:notes) { create_list(:note, 5) }
  let(:note_id) { notes.first.id }

  describe "GET /notes" do
    it "returns all notes" do
      get "/notes"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe "GET /notes/:id" do
    it "returns the note" do
      get "/notes/#{note_id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(note_id)
    end

    it "returns status code 404 if the note is not found" do
      get "/notes/0"
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('Note not found')
    end
  end

  describe "POST /notes" do
    let(:valid_attributes) { { note: { title: "New Note", content: "This is a new note content" } } }

    it "creates a new note" do
      expect {
        post "/notes", params: valid_attributes
      }.to change(Note, :count).by(1)
      expect(response).to have_http_status(:created)
    end

    it "returns an error when the title is missing" do
      post "/notes", params: { note: { content: "Content without a title" } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT /notes/:id" do
    let(:valid_attributes) { { note: { title: "Updated Note", content: "Updated content" } } }

    it "updates the note" do
      put "/notes/#{note_id}", params: valid_attributes
      expect(response).to have_http_status(:ok)
      expect(Note.find(note_id).title).to eq("Updated Note")
    end

    it "returns an error when the update is invalid" do
      put "/notes/#{note_id}", params: { note: { title: "" } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE /notes/:id" do
    it "deletes the note" do
      expect {
        delete "/notes/#{note_id}"
      }.to change(Note, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end

    it "returns status code 404 if the note is not found" do
      delete "/notes/0"
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('Note not found')
    end
  end
end
