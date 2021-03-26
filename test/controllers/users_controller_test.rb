require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "/users/login error auth" do
    post("/users/login", params: { username: "landres", password: "192929" })

    assert_response :unauthorized
    expected_res = { error: I18n.t('user.invalid_credentials') }.to_json
    assert_equal expected_res, @response.body
  end

  test "/users/login success auth" do
    post("/users/login", params: { username: "landres", password: "SecretPass" })

    assert_response :ok
    assert_not_empty JSON.parse(@response.body)['results']['token']
  end
end
