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

  end

end
