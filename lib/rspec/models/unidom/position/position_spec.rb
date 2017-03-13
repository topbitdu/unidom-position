describe Unidom::Position::Position, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      organization_id:   SecureRandom.uuid,
      organization_type: 'Unidom::Position::Organization::Mock',
      occupation_id:     SecureRandom.uuid,
      name:              'Some Position'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates text', model_attributes, :name, length: 2..described_class.columns_hash['name'].limit

    occupation_attributes = {
      scheme_id:   SecureRandom.uuid,
      scheme_type: 'Unidom::Position::Scheme::Mock',
      code:        '5-1-99',
      name:        'Some Occupation'
    }

    it_behaves_like 'belongs_to', model_attributes, :occupation, Unidom::Position::Occupation, occupation_attributes

    post_1_attributes = {
      organization_id:   SecureRandom.uuid,
      organization_type: 'Unidom::Position::Organization::Mock',
      #position_id:       SecureRandom.uuid,
      name:              'Some Post #1'
    }

    post_2_attributes = {
      organization_id:   SecureRandom.uuid,
      organization_type: 'Unidom::Position::Organization::Mock',
      #position_id:       SecureRandom.uuid,
      name:              'Some Post #2'
    }

    it_behaves_like 'has_many', model_attributes, :posts, Unidom::Position::Post, [ post_1_attributes, post_2_attributes ]

  end

end
