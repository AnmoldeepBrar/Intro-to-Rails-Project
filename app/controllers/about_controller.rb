class AboutController < ApplicationController
    def index
        # Fetch details about your data sources as described in 1.1
        @data_sources = [
          { name: 'Books CSV', description: 'CSV file containing book data.' },
          { name: 'Faker Gem', description: 'Gem used to generate fake data for magazines.' }
        ]
      end
end
