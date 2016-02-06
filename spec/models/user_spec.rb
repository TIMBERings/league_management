require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'can be created' do
    expect{FactoryGirl.create(:user)}.to change{User.count}.from(0).to(1)
  end
  it 'can be deleted' do
    user = FactoryGirl.create(:user)
    expect{user.destroy}.to change{User.count}.from(1).to(0)
    expect{User.find(user.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
  it 'can be edited' do
    user = FactoryGirl.create(:user)
    email = 'change@example.org'
    user.email = email
    user.confirm
    user.reload
    user.save!
    expect(user.email).to eq email
  end

  context 'database_authenticatable' do
    it 'encrypts the password'
  end

  context 'registerable' do
    it 'holds required fields for registering'
  end

  context 'recoverable' do
    it 'allows for resetting a password'
    it 'signs the user in automatically after resetting a password'
    it 'generates proper keys'
  end

  context 'rememberable' do
    it 'can remember credentials'
    it 'can forget credentials'
  end

  context 'trackable' do
    it 'updates sign_in_count'
    it 'updates current_sign_in_at'
    it 'updates last_sign_in_at'
    it 'keeps the current_sign_in_ip'
    it 'keeps the last_sign_in_ip'
    it '#update_tracked_fields is called'
  end

  context 'validatable' do
    context 'email' do
      it 'requires email' do
        expect{FactoryGirl.create(:user, email: nil)}.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'cannot be duplicated' do
        FactoryGirl.create(:user, email: 'test@example.com')
        expect{FactoryGirl.create(:user, email: 'Test@example.com')}.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'requires the correct format' do
        expect{FactoryGirl.create(:user, email: 'Test')}.to raise_error(ActiveRecord::RecordInvalid)
        expect{FactoryGirl.create(:user, email: 'Test@example')}.to raise_error(ActiveRecord::RecordInvalid)
        expect{FactoryGirl.create(:user, email: 'Test@.com')}.to raise_error(ActiveRecord::RecordInvalid)
        expect{FactoryGirl.create(:user, email: '@example.com')}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'password' do
      it 'requires a password' do
        expect{FactoryGirl.create(:user, password: nil)}.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'requires a confirmation' do
        expect{FactoryGirl.create(:user, password_confirmation: nil)}.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'is of proper length' do
        expect{FactoryGirl.create(:user, password: 'Test123', password_confirmation: 'Test123')}.to raise_error(ActiveRecord::RecordInvalid)
        expect{FactoryGirl.create(:user, password: 'Test1234', password_confirmation: 'Test1234')}.not_to raise_error
      end
    end
  end

  context 'confirmable' do
    it 'can be confirmed'
    it 'prevents login without confirm'
  end

  context 'lockable' do
    it 'can be locked'
    it 'can be unlocked'
  end
end
