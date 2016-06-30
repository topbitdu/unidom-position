desc 'unidom:position:occupation:import Rake Task imports occupations from the given CSV file.'

namespace :unidom do
  namespace :position do

    namespace :occupation do

      # bundle exec rake unidom:position:occupation:import
      #   file=/data.csv
      #   from_date=2020-01-01
      #   scheme_id=
      #   scheme_type=
      task import: :environment do

        include Unidom::Common::DataHelper

        file_name   = ENV['file']
        scheme_id   = ENV['scheme_id']||Unidom::Common::NULL_UUID
        scheme_type = ENV['scheme_type']||''
        opened_at   = parse_time ENV['from_date']

        updated_count = 0
        created_count = 0

        occupation_entities = Unidom::Position::Occupation.scheme_id_is(scheme_id).scheme_type_is(scheme_type).to_a

        each_csv_row file_name do |occupation|

          code = occupation['code']
          name = occupation['name']

          attributes = { name: occupation['name'], scheme_id: scheme_id, scheme_type: scheme_type, opened_at: opened_at }

          if occupation_entities.present?
            found_occupation_entities = occupation_entities.select { |occupation_entity| occupation_entity.code==code }
            if found_occupation_entities.present?
              found_occupation_entities.each do |found_occupation_entity|
                found_occupation_entity.assign_attributes attributes
                if found_occupation_entity.changed?
                  found_occupation_entity.save!
                  updated_count += 1
                end
              end
            else
              attributes[:code] = code
              Unidom::Position::Occupation.create! attributes
              created_count += 1
            end
          else
            attributes[:code] = code
            Unidom::Position::Occupation.create! attributes
            created_count += 1
          end

        end

        puts "#{created_count} Occupations were created. #{updated_count} Occupations were updated per CSV."
        puts "#{created_count+updated_count} Occupations were handled totally."

      end

    end

  end
end
