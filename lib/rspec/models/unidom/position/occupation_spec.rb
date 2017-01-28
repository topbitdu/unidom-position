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

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
