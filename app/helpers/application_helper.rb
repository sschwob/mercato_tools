module ApplicationHelper
    def format_datetime(datetime)
        datetime.strftime('%d/%m/%Y à %H:%M:%S')
    end
end
