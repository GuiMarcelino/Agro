# db/seeds.rb

# Criando 10 registros de Note
note_success = true
10.times do |i|
  note = Note.create(
    title: FFaker::NameBR.name,
    content: FFaker::Lorem.sentence(10)
  )

  unless note.persisted?
    note_success = false
    puts "Falha ao criar nota #{i + 1}. Erros: #{note.errors.full_messages.join(', ')}"
  end
end

puts "Notas criadas com sucesso!" if note_success
