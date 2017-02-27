describe Unidom::Position::Occupation, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      scheme_id:   SecureRandom.uuid,
      scheme_type: 'Unidom::Position::Scheme::Mock',
      code:        '5-1-99',
      name:        'Some Occupation'
    }

    name_max_length = described_class.columns_hash['name'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :name,
      {             } => 0,
      { name: nil   } => 2,
      { name: ''    } => 2,
      { name: 'A'   } => 1,
      { name: 'AA'  } => 0,
      { name: 'AAA' } => 0,
      { name: 'A'*(name_max_length-1) } => 0,
      { name: 'A'*name_max_length     } => 0,
      { name: 'A'*(name_max_length+1) } => 1

    position_1_attributes = {
      organization_id:   SecureRandom.uuid,
      organization_type: 'Unidom::Position::Organization::Mock',
      name:              'Some Position #1'
    }

    position_2_attributes = {
      organization_id:   SecureRandom.uuid,
      organization_type: 'Unidom::Position::Organization::Mock',
      name:              'Some Position #2'
    }

    it_behaves_like 'has_many', model_attributes, :positions, Unidom::Position::Position, [ position_1_attributes, position_2_attributes ]

  end

end
