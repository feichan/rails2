class Member < ActiveRecord::Base
	require 'digest/sha1'
	# validate fields
	validates_presence_of :account, :passwd, :auth, :message => "不可为空"
	validates_uniqueness_of :account, :message => "该账号已被使用"

  belongs_to :college
  belongs_to :hospital

  def password
    @passwd
  end

  def password=(pwd)
    @passwd = pwd
    return if pwd.blank?
    self.passwd = Member.encrypted_password(pwd)
  end

  def self.authenticate(account, password)
    user = self.find_by_account(account)
    if user
      expected_password = encrypted_password(password)
      if user.passwd != expected_password
        user = nil
      end
    end
    user
  end

  private
  def self.encrypted_password(password)
    string_to_hash = password + "fcicada"
    Digest::SHA1.hexdigest(string_to_hash)
  end

end
