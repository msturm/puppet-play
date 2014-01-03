require 'spec_helper'
describe 'play' do
  let(:boxen_home) { '/opt/boxen' }
  let(:brewdir)    { "#{boxen_home}/homebrew" }
  let(:envdir)     { "#{boxen_home}/env.d" }
  let(:facts) do
    {
      :boxen_home => boxen_home,
      :luser      => 'msturm',
      :boxen_user => 'msturm'
    }
  
  end
  it do
    should contain_homebrew__formula('play').with_before('Package[boxen/brews/play]')
    should contain_package('boxen/brews/play').with({
      :ensure => '2.1.1-boxen1',
    })
  end
end
