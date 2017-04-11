describe Unidom::Position::Post, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      organization_id:   SecureRandom.uuid,
      organization_type: 'Unidom::Position::Organization::Mock',
      position_id:       SecureRandom.uuid,
      name:              'Some Post'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates text', model_attributes, :name,
      length: 2..described_class.columns_hash['name'].limit

    position_attributes = {
      organization_id:   SecureRandom.uuid,
      organization_type: 'Unidom::Position::Organization::Mock',
      occupation_id:     SecureRandom.uuid,
      name:              'Some Position'
    }

    it_behaves_like 'belongs_to', model_attributes, :position, Unidom::Position::Position, position_attributes

  end

end
