# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Medium.destroy_all
MediaKind.destroy_all
Subcategory.destroy_all
Category.destroy_all

p "===== Creation des types de média ====="
media_kinds = ["Vidéo", "Image", "Lien"]
media_kinds.each { |name| MediaKind.create!(name: name) }

p "===== Creation des catégories ====="
categories = ["Personnages Légendaires", "Légendes Galactiques", "Factions",
              "Modules", "Zêtas", "Omicrons", "Datacrons", "Conquête", "Défis Galactiques", "Vaisseaux"]
categories.each { |name| Category.create!(name: name) }

p "===== Creation des sous catégories ====="
subcategories = ["Chevalier Jedi Luke", "Grand Maître Yoda", "Chevalier Jedi Reven", "Général Skywalker"]
subcategories.each { |name| Subcategory.create!(category: Category.first, name: name) }

p "===== Creation des médias ====="
Medium.create!(name: "Utilisez vous correctement JKL ?", source: "D2OzX_f9YjM", media_kind: MediaKind.first, categorisable: Subcategory.first)
Medium.create!(name: "Guide Jedi Luke ! Tous les niveaux en détail", source: "T13fZ8Bted8", media_kind: MediaKind.first, categorisable: Subcategory.first)
Medium.create!(name: "JKL contre presque toutes les GL avec ce Datacron", source: "1yfqfE0Hedw", media_kind: MediaKind.first, categorisable: Subcategory.first)
Medium.create!(name: "Chevalier Jedi Luke Skywalker", source: "iQ6kcsujWH4", media_kind: MediaKind.first, categorisable: Subcategory.first)
Medium.create!(name: "Unlocking Jedi Knight Luke Skywalker for FREE in 2023", source: "n26A76spcJw", media_kind: MediaKind.first, categorisable: Subcategory.first)

p "===== Création des users ====="
User.create(ally_code: 959947962, email: "test1@test.com", password: "password", admin: true)
User.create(ally_code: 311761761, email: "test2@test.com", password: "password")
User.create(ally_code: 513688711, email: "test3@test.com", password: "password")
