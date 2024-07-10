module ApplicationHelper
    def format_datetime(datetime)
        datetime.strftime('%d/%m/%Y à %H:%M:%S')
    end

    def grouped_category_options_for_select
        grouped_categories = Category.filtered_grouped_categories
    
        grouped_options = grouped_categories.map do |parent, categories|
          [
            parent ? parent.name : 'Divers',
            categories.map { |category| [category.name, category.id] }
          ]
        end
    
        grouped_options.sort_by { |group| group.first }
    end
end
