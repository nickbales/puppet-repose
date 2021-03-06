require 'spec_helper'
describe 'repose::filter::compression', :type => :define do
  let :pre_condition do
    'include repose'
  end
  context 'on RedHat' do
    let :facts do 
    {
      :osfamily               => 'RedHat',
      :operationsystemrelease => '6',
    }
    end

    context 'default parameters' do
      let(:title) { 'default' }
      it {
        should contain_file('/etc/repose/compression.cfg.xml').
          with_content(/compression compression-threshold=\"1024\" debug=\"false\" include-content-types=\"text\/html\"/)
      }
    end

  end
end
