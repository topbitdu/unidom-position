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

  end

end