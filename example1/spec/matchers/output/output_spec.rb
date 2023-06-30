describe 'Output' do
  it { expect{ puts 'foo' }.to output.to_stdout }
  it { expect{ print 'foo' }.to output('foo').to_stdout }
  it { expect{ puts 'foo' }.to output(/foo/).to_stdout }

  it { expect{ warn 'foo' }.to output.to_stderr }
  it { expect{ warn 'foo' }.to output(/foo/).to_stderr }
end
