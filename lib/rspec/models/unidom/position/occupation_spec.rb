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

    it_behaves_like 'validates text', model_attributes, :name,
      length: 2..described_class.columns_hash['name'].limit

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

=begin
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
=end

    it_behaves_like 'scope', :scheme_id_is, [
      { attributes_collection: [ model_attributes                                             ], count_diff: 1, args: [ model_attributes[:scheme_id] ] },
      { attributes_collection: [ model_attributes                                             ], count_diff: 0, args: [ Unidom::Common::NULL_UUID    ] },
      { attributes_collection: [ model_attributes.merge(scheme_id: Unidom::Common::NULL_UUID) ], count_diff: 0, args: [ model_attributes[:scheme_id] ] },
      { attributes_collection: [ model_attributes.merge(scheme_id: Unidom::Common::NULL_UUID) ], count_diff: 1, args: [ Unidom::Common::NULL_UUID    ] }
    ]

    it_behaves_like 'scope', :scheme_type_is, [
      { attributes_collection: [ model_attributes                                                       ], count_diff: 1, args: [ model_attributes[:scheme_type]    ] },
      { attributes_collection: [ model_attributes                                                       ], count_diff: 0, args: [ 'Unidom::Position::Scheme::Mock2' ] },
      { attributes_collection: [ model_attributes.merge(scheme_type: 'Unidom::Position::Scheme::Mock2') ], count_diff: 0, args: [ model_attributes[:scheme_type]    ] },
      { attributes_collection: [ model_attributes.merge(scheme_type: 'Unidom::Position::Scheme::Mock2') ], count_diff: 1, args: [ 'Unidom::Position::Scheme::Mock2' ] }
    ]

  end

end
