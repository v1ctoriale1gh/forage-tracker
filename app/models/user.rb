class User < ApplicationRecord
    has_secure_password
    has_many :expeditions
    has_many :harvests, through: :expeditions
    validates :email, uniqueness: true

    
    def found_items
        self.harvests.collect(&:item).uniq.sort
    end

    def dated_harvests
      self.expeditions.order(:date_and_time).collect(&:harvests)
    end

    def location_harvests
        self.expeditions.location_group.collect(&:harvests)
    end

    def self.find_or_create_by_omniauth(auth_hash)
      byebug
        #If the user is already in the db
        if self.find_by(email: auth_hash['info']['email']) 
            #return the user
            @user = self.find_by(email: auth_hash['info']['email'])
        else 
            username = auth_hash['info']['name']
            name = auth_hash['info']['name']
            #create and return new user
            password = SecureRandom.hex
            @user = self.create(email: auth_hash['info']['email'], username: username, name: name, password: password)
            byebug
        end
        @user
    end

end

#This is the auth hash
#(byebug) auth_hash
##<OmniAuth::AuthHash credentials=#<OmniAuth::AuthHash expires=true expires_at=1594833547 token="ya29.a0AfH6SMC1jlXc1uecpu60S-1l4Fu7RVlL3UPHalO5tGfk49CPCqI3LlPqU78fYPGIibGVS0mFd9I6nTmKv8Kc0Jke3KyFGphIQG0wnk_HOMeiX3a57XSLU8c4MX6S8RHrmbxg8AT-s7gVZBbW2-NrHLPPR5NtLm1-qyw"> extra=#<OmniAuth::AuthHash id_token="eyJhbGciOiJSUzI1NiIsImtpZCI6IjRlNGViZTQ4N2Q1Y2RmMmIwMjZhM2IyMjlkODZmMGQ0MjU4NDQ5ZmUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiIxMTc4MTI5MDExNDgtZnJvNmx0OW1iY21taTJmMmxjaTlqOGljN3ZjODJpZTAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMTc4MTI5MDExNDgtZnJvNmx0OW1iY21taTJmMmxjaTlqOGljN3ZjODJpZTAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDQ2NTMxNjM4MjEwMDQwMzQ2OTciLCJlbWFpbCI6InRvcmlzaGlsbGN1dHRAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF0X2hhc2giOiJ0TzhzX3BIbFFYV2VrUUJ4eS1Nd2p3IiwibmFtZSI6IlRvcmkgU2hpbGxjdXR0IiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hLS9BT2gxNEdnc20zNlFwNW1reW1ScFZtdjEtQU1YZVdjejhLdnBoV1hqbGYtRWJBPXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IlRvcmkiLCJmYW1pbHlfbmFtZSI6IlNoaWxsY3V0dCIsImxvY2FsZSI6ImVuIiwiaWF0IjoxNTk0ODI5OTQ4LCJleHAiOjE1OTQ4MzM1NDh9.LZ9epTQ3MuNgYFWoEIg0fF4gs7HXF9LHroBqmMYug24xCDaa9TWjLfOise3LykP4ynW1WXAKBtycVI8zFmIWVj5r_XrwIPX9S36cF2mMDd-vMiQkV3VP60FVsFLfYOpsxwSeXPNNtY-Yn-3LAy7il_A9eOHyD-dvO7C6tXo8pCUXi13qEJqnEwZ1C7a7Jw_fngyTy5KlwmlozddPsp7kWmDpdgCXorKHpwprO-Bqmhi5NDTuzhsub9_OtOVXT3ggEboYGyusSnSxtBtBbnRiTubuapOmCuVpS8_FFXmLZPzXV6i-6I48eK7tIvC9NhhdRasIdfTDUEpdfGZQ37PUug" raw_info=#<OmniAuth::AuthHash email="torishillcutt@gmail.com" email_verified=true family_name="Shillcutt" given_name="Tori" locale="en" name="Tori Shillcutt" picture="https://lh3.googleusercontent.com/a-/AOh14Ggsm36Qp5mkymRpVmv1-AMXeWcz8KvphWXjlf-EbA" sub="104653163821004034697">> info=#<OmniAuth::AuthHash::InfoHash email="torishillcutt@gmail.com" email_verified=true first_name="Tori" image="https://lh3.googleusercontent.com/a-/AOh14Ggsm36Qp5mkymRpVmv1-AMXeWcz8KvphWXjlf-EbA" last_name="Shillcutt" name="Tori Shillcutt" unverified_email="torishillcutt@gmail.com"> provider="google_oauth2" uid="104653163821004034697">
#(byebug) pp auth_hash
#{"provider"=>"google_oauth2",
# "uid"=>"104653163821004034697",
# "info"=>
#  {"name"=>"Tori Shillcutt",
#   "email"=>"torishillcutt@gmail.com",
#   "unverified_email"=>"torishillcutt@gmail.com",
#   "email_verified"=>true,
#   "first_name"=>"Tori",
#   "last_name"=>"Shillcutt",
#   "image"=>
#    "https://lh3.googleusercontent.com/a-/AOh14Ggsm36Qp5mkymRpVmv1-AMXeWcz8KvphWXjlf-EbA"},
# "credentials"=>
#  {"token"=>
#    "ya29.a0AfH6SMC1jlXc1uecpu60S-1l4Fu7RVlL3UPHalO5tGfk49CPCqI3LlPqU78fYPGIibGVS0mFd9I6nTmKv8Kc0Jke3KyFGphIQG0wnk_HOMeiX3a57XSLU8c4MX6S8RHrmbxg8AT-s7gVZBbW2-NrHLPPR5NtLm1-qyw",
#   "expires_at"=>1594833547,
#   "expires"=>true},
# "extra"=>
#  {"id_token"=>
#    "eyJhbGciOiJSUzI1NiIsImtpZCI6IjRlNGViZTQ4N2Q1Y2RmMmIwMjZhM2IyMjlkODZmMGQ0MjU4NDQ5ZmUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiIxMTc4MTI5MDExNDgtZnJvNmx0OW1iY21taTJmMmxjaTlqOGljN3ZjODJpZTAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMTc4MTI5MDExNDgtZnJvNmx0OW1iY21taTJmMmxjaTlqOGljN3ZjODJpZTAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDQ2NTMxNjM4MjEwMDQwMzQ2OTciLCJlbWFpbCI6InRvcmlzaGlsbGN1dHRAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF0X2hhc2giOiJ0TzhzX3BIbFFYV2VrUUJ4eS1Nd2p3IiwibmFtZSI6IlRvcmkgU2hpbGxjdXR0IiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hLS9BT2gxNEdnc20zNlFwNW1reW1ScFZtdjEtQU1YZVdjejhLdnBoV1hqbGYtRWJBPXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IlRvcmkiLCJmYW1pbHlfbmFtZSI6IlNoaWxsY3V0dCIsImxvY2FsZSI6ImVuIiwiaWF0IjoxNTk0ODI5OTQ4LCJleHAiOjE1OTQ4MzM1NDh9.LZ9epTQ3MuNgYFWoEIg0fF4gs7HXF9LHroBqmMYug24xCDaa9TWjLfOise3LykP4ynW1WXAKBtycVI8zFmIWVj5r_XrwIPX9S36cF2mMDd-vMiQkV3VP60FVsFLfYOpsxwSeXPNNtY-Yn-3LAy7il_A9eOHyD-dvO7C6tXo8pCUXi13qEJqnEwZ1C7a7Jw_fngyTy5KlwmlozddPsp7kWmDpdgCXorKHpwprO-Bqmhi5NDTuzhsub9_OtOVXT3ggEboYGyusSnSxtBtBbnRiTubuapOmCuVpS8_FFXmLZPzXV6i-6I48eK7tIvC9NhhdRasIdfTDUEpdfGZQ37PUug",
#   "raw_info"=>
#    {"sub"=>"104653163821004034697",
#     "name"=>"Tori Shillcutt",
#     "given_name"=>"Tori",
#     "family_name"=>"Shillcutt",
#     "picture"=>
#      "https://lh3.googleusercontent.com/a-/AOh14Ggsm36Qp5mkymRpVmv1-AMXeWcz8KvphWXjlf-EbA",
#     "email"=>"torishillcutt@gmail.com",
#     "email_verified"=>true,
#     "locale"=>"en"}}}