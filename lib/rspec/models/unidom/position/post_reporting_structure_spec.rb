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

  end

end
