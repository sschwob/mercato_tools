require "json"

class ImportService

    def self.import_categories
        data = read_json("app/data/categories.json")
        data["categories"].each do |category|
            new_category = Category.create(name: category["name"])
            if category["subcategories"].present?
                category["subcategories"].each do |subcategory|
                    Category.create(name: subcategory, parent_id: new_category.id)
                end
            end
        end
    end

    def self.import_teams
        read_json("app/data/teams.json")["teams"]
    end

    private

    def self.read_json(filepath)
        serialized_data = File.read(filepath)
        JSON.parse(serialized_data)
    end
end
