require 'rails_helper'

RSpec.describe NoteSerializer, type: :serializer do
  let(:note) { create(:note)}
  let(:serialized_note) { described_class.new(note).as_json }

  it "serializes the id" do
    expect(serialized_note[:id]).to eq(note.id)
  end

  it "serializes the title" do
    expect(serialized_note[:title]).to eq(note.title)
  end

  it "serializes the content" do
    expect(serialized_note[:content]).to eq(note.content)
  end

  it "does not include extra attributes" do
    expect(serialized_note.keys).to contain_exactly(:id, :title, :content)
  end
end
