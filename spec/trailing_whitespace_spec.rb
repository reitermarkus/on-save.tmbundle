require 'Support/trailing_whitespace'

describe 'trailing_whitespace' do
  context 'markdown' do
    before(:each) do
      allow(ENV).to receive(:fetch).and_call_original
      allow(ENV).to receive(:fetch).with('TM_SCOPE', any_args).and_return('text.html.markdown')
    end

    describe '#markdown?' do
      it 'returns true' do
        expect(markdown?).to be true
      end
    end

    it 'leaves two spaces at the end of a line' do
      line =    '  This is a line   '
      trimmed = '  This is a line  '

      expect(trim(line)).to eq(trimmed)
    end

    it 'leaves whitespace-only lines to preserve indentation in code-blocks and lists' do
      line =    '     '
      trimmed = '     '

      expect(trim(line)).to eq(trimmed)
    end
  end

  it 'trims whitespace-only lines' do
    line =    '     '
    trimmed = ''

    expect(trim(line)).to eq(trimmed)
  end

  it 'trims whitespace at the end of a line' do
    expect(trim('foo ')).to eq('foo')
    expect(trim('foo  ')).to eq('foo')
    expect(trim('foo   ')).to eq('foo')
  end

  it 'does not trim an escaped whitespace character at the end of a line' do
    expect(trim('foo\ ')).to eq('foo\ ')
    expect(trim('foo\  ')).to eq('foo\ ')
    expect(trim('foo\   ')).to eq('foo\ ')
  end

  it 'does not trim an escaped whitespace character at the end of a line', :focus do
    expect(trim("foo\\\\ ")).to eq("foo\\\\")
    expect(trim("foo\\\\  ")).to eq("foo\\\\")
    expect(trim("foo\\\\   ")).to eq("foo\\\\")
    expect(trim("foo\\\\\\ ")).to eq("foo\\\\\\ ")
  end
end
