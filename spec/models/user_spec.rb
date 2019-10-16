require 'rails_helper'

RSpec.describe User, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
    before do
        @user = User.new(name: "Example User", email: "user@example.com")
    end

    #ユーザー自体(name)の存在について
    it "値が入っている場合" do
       expect(@user).to be_truthy
     # assert @user.valid?
    end

    #ユーザー(name)が空白でない
    it "name should be present" do
      @user.name = "     "
      assert @user.invalid?
    end

    #メールの存在について
   it "emailが空白の場合" do
    @user.email = " "
    assert @user.invalid?
  end

  #lengthについて
  it "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    expect(@user).to be_invalid
  end
#ok#
  #メールのフォーマットについて
  #it "email validation should accept valid addresses" do
  #  valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
  #                       first.last@foo.jp alice+bob@baz.cn]
  #    valid_addresses.each do |valid_address|
  #        @user.email = valid_address
        #ここ↓
  #       assert @user.valid?, "#{valid_address.inspect} should be valid"
  #      # expect(@user).to be_valid
  #      end
  #  end

  #メールの正規表現
    it "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                               foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |invalid_address|
          @user.email = invalid_address
          #↓ここのassert_not→expect
          assert @user.invalid?, "#{invalid_address.inspect} should be invalid"
        end
    end

  #メールが一意であるか
    it "email addresses should be unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      #ここ↓
      @user.save
      expect(duplicate_user).to be_invalid
    end
end