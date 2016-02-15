require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'can be created' do
    expect { FactoryGirl.create(:user) }.to change { User.count }.from(0).to(1)
  end
  it 'can be deleted' do
    user = FactoryGirl.create(:user)
    expect { user.destroy }.to change { User.count }.from(1).to(0)
    expect { User.find(user.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
  it 'can be edited' do
    user = FactoryGirl.create(:user)
    user.confirm
    user.reload

    email = 'change@example.org'
    user.email = email
    user.save!
    user.confirm

    expect(User.find(user.id).email).to eq email
  end

  context 'database_authenticatable' do
    it 'encrypts the password' do
      password = 'Test1234'
      user = FactoryGirl.create(:user,
                                password: password,
                                password_confirmation: password)
      expect(user.encrypted_password).not_to eq password
      expect(user.encrypted_password.length).to eq 60
    end
  end

  context 'registerable' do
    it 'requires username'
    it 'requires password'
    it 'requires password_confirmation'
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
    let(:user) { FactoryGirl.create(:user) }
    before :each do
      user.confirm
    end
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
        expect { FactoryGirl.create(:user, email: nil) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'cannot be duplicated' do
        FactoryGirl.create(:user, email: 'test@example.com')
        expect { FactoryGirl.create(:user, email: 'Test@example.com') }
          .to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'requires the correct format' do
        expect { FactoryGirl.create(:user, email: 'Test') }
          .to raise_error(ActiveRecord::RecordInvalid)
        expect { FactoryGirl.create(:user, email: 'Test@example') }
          .to raise_error(ActiveRecord::RecordInvalid)
        expect { FactoryGirl.create(:user, email: 'Test@.com') }
          .to raise_error(ActiveRecord::RecordInvalid)
        expect { FactoryGirl.create(:user, email: '@example.com') }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'password' do
      it 'requires a password' do
        expect { FactoryGirl.create(:user, password: nil) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'requires a confirmation' do
        expect { FactoryGirl.create(:user, password_confirmation: nil) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'is of proper length' do
        expect do
          FactoryGirl.create(:user,
                             password: 'Test123',
                             password_confirmation: 'Test123')
        end.to raise_error(ActiveRecord::RecordInvalid)
        expect do
          FactoryGirl.create(:user,
                             password: 'Test1234',
                             password_confirmation: 'Test1234')
        end.not_to raise_error
      end
    end
  end

  context 'confirmable' do
    it 'can be confirmed'
    it 'prevents login without confirm'
  end

  context 'lockable' do
    let(:user) {FactoryGirl.create(:user)}
    before :each do
      user.confirm
    end
    it 'can be locked' do
      user.lock_access!

      expect(user.locked_at?).to be true
      expect(user.locked_at).to be_within(1.second).of(DateTime.now)
      expect(user.unlock_token).not_to be nil
    end
    it 'can be unlocked' do
      user.lock_access!
      user.unlock_access!

      expect(user.locked_at?).to be false
      expect(user.locked_at).to be nil
      expect(user.unlock_token).to be nil
    end
  end
end
