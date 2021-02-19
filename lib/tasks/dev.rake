namespace :dev do

    DEFAULT_PASSWORD = '123456'
    DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
        if Rails.env.development?
        show_spinner("Apagando BD...") { %x(rails db:drop) }
        show_spinner("Criando BD...") { %x(rails db:create) }
        show_spinner("Migrando BD...") { %x(rails db:migrate) }
        show_spinner("Cadastrando o professores padrão...") { %x(rails dev:add_default_teacher) }
        show_spinner("Cadastrando mais professores...") { %x(rails dev:add_more_teacher) }
        # show_spinner("Cadastrando assuntos padrões...") { %x(rails dev:add_subjects) }
        show_spinner("Cadastrando as aulas padrões...") { %x(rails dev:add_schedules) }        
        # show_spinner("Cadastrando questões padrões...") { %x(rails dev:add_answers_and_questions) }
        else
        puts "Você não está em ambiente de desenvolvimento!"
        end
    end

    desc "Adiciona o administrador padrão"
    task add_default_teacher: :environment do
        Teacher.create!(
        email: 'teacher@edu.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
        )
    end

    desc "Adiciona o administrador padrão"
    task add_more_teacher: :environment do
        10.times do |i|
            Teacher.create!(
            email: Faker::Internet.email,
            password: DEFAULT_PASSWORD,
            password_confirmation: DEFAULT_PASSWORD
            )
        end
    end

    desc "Adiciona assuntos padrões"
    task add_subjects: :environment do
        file_name = 'subjects.txt'
        file_path = File.join(DEFAULT_FILES_PATH, file_name)
        File.open(file_path, 'r').each do |line|
        Subject.create!(description: line.strip)
        end
    end

    desc "Adiciona o administrador padrão"
    task add_schedules: :environment do
        10.times do |i|
            Schedule.create!(
                teacher: Teacher.all.sample,
                description: Faker::Lorem.question,
                subject: Faker::Lorem.sentence,
                day: 'segunda')
        end
    end

    private

    def show_spinner(msg_start, msg_end = "Concluído!")
        spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
        spinner.auto_spin
        yield
        spinner.success("(#{msg_end})")    
    end
end
