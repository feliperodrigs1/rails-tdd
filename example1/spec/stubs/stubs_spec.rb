require 'student'
require 'course'

describe 'Stub' do
  it '#has_finished?' do
    student = Student.new
    course = Course.new

    allow(student)
      .to receive(:has_finished?).with(an_instance_of(Course)).and_return(true)

    finished = student.has_finished?(course)
    expect(finished).to be_truthy
  end

  it 'dynamic arguments' do
    student = Student.new

    allow(student).to receive(:foo) do |arg|
      if arg == :hello
        'hello!'
      elsif arg == :hi
        'hi!'
      end
    end

    expect(student.foo(:hello)).to eq('hello!')
    expect(student.foo(:hi)).to eq('hi!')
  end

  it 'any class instance' do
    student = Student.new
    counter_student = Student.new

    allow_any_instance_of(Student).to receive(:foo).and_return(true)

    expect(student.foo).to be_truthy
    expect(counter_student.foo).to be_truthy
  end

  it 'error' do
    student = Student.new

    allow_any_instance_of(Student).to receive(:foo).and_raise(RuntimeError)

    expect{ student.foo }.to raise_error(RuntimeError)
  end
end
