module Secured
    def authenticate_user!
        token_regex = /Bearer (\w+)/
        #read the header 
        headers = request.headers
        #if this is valid 
        if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
            token = headers['Authorization'].match(token_regex)[1]
            user = User.find_by_auth_token(token)
            if(Current.user = User.find_by_auth_token(token))
                return
            end
        end
        #related with an user 
        render json: {error: 'Unauthorized'}, status: :unauthorized
    end
end