describe Unidom::Position::PostReportingStructure, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      superior_post_id: SecureRandom.uuid,
      inferior_post_id: SecureRandom.uuid
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    post_attributes = {
      organization_id:   SecureRandom.uuid,
      organization_type: 'Unidom::Position::Organization::Mock',
      position_id:       SecureRandom.uuid,
      name:              'Some Post'
    }

    it_behaves_like 'belongs_to', model_attributes, :superior_post, Unidom::Position::Post, post_attributes
    it_behaves_like 'belongs_to', model_attributes, :inferior_post, Unidom::Position::Post, post_attributes

  end

end
