class FakeConsole
  attr_reader :printed_string

  def stub_get_input(input)
    @input = input
  end

  def retrieve_user_input
    @input.shift
  end

  def print_message(string)
    @printed_string = string
  end
end
