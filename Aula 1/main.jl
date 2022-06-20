
# 1- 
# a) Crie uma função designada por bubble_sort() e programe o algoritmo Bubble-Sort(). 
# Em seguida programe o algoritmo de ordenação Insertion-Sort(). 
# Utilize para teste dos algoritmos tabelas aleatórias com distribuição normal de média nula e desvio padrão = 1.0.

# b) Utilize o package Plots.jl para criar um gráfico que permite observar as taxas assimptóticas de 
# crescimento dos tempos de execução dos algoritmos de ordenação Bubble-Sort e Insertion-Sort.

# c) Obtenha os gráficos com erros relativos para cada ponto representado inferior a 10%.

# 2- 
# a) Leia um ficheiro de dados, em formato csv, em que em cada linha tem o número 
# mecanográfico dum aluno, o seu nome completo, e a sua data de nascimento.

# b) Demonstre o funcionamento dos algoritmos de ordenação que realizou com este ficheiro de dados.

# 3-
# a) Apesar de não apresentar nenhuma vantagem a realização recursiva dos algoritmos Bubble-Sort e 
# Insertion-Sort programe estas versões.

# b) Tente programar os algoritmos usando «array comprehensions». 
# Esta são o equivalente das já conhecidas compreensões de lista.

# c) Programe os algoritmos usando uma abordagem em que adota o paradigma de programação 
# funcional com as funções map(), filter() e reduce(). 
# Tente programar uma função que calcule o desvio padrão com estas funções. 
# Programe adicionalmente uma função que elimina os números negativos da tabela de entrada.

include("../modulos/MyBubbleSort.jl")
include("../modulos/MyInsertionSort.jl")

using Random, Distributions, Plots, CSV, DataFrames
import .BubbleSort.bubble_sort!, .InsertSort.insertion_sort!, .InsertSort.insertion_sort_d!


function media(X)
    μ = sum(X) / length(X)
    μ
end

function desvio(x, μ)
    (x - μ)^2
end

function desvio_padrao(X)
    μ = media(X)
    Y = zeros(length(X))

    for k = 1:length(X)
        Y[k] = desvio(X[k], μ)
    end

    σ = sum(Y) / length(X)
    σ
end

function erro_relativo(μ, σ)
    ϵ = (σ / μ) * 100
    ϵ
end

function medir_tempo!(A, N, index, T, sample_size)
    T[index, 1] = N
    T1 = zeros(sample_size)
    T2 = zeros(sample_size)
    for i = 1:sample_size
        A1 = A
        A2 = A
        t1 = @elapsed insertion_sort!(A1)
        t2 = @elapsed bubble_sort!(A2)
        T1[i] = t1
        T2[i] = t2
    end

    println("T1 = $T1")
    println("---------------------------------")
    println("T2 = $T2")
    println("---------------------------------")

    μT1 = media(T1)
    println("μT1 = $μT1")
    println("---------------------------------")
    μT2 = media(T2)
    println("μT2 = $μT2")
    println("---------------------------------")

    σT1 = desvio_padrao(T1)
    println("σT1 = $σT1")
    println("---------------------------------")
    σT2 = desvio_padrao(T2)
    println("σT2 = $σT2")
    println("---------------------------------")

    ϵT1 = erro_relativo(μT1, σT1)
    println("ϵT1 = $ϵT1")
    println("---------------------------------")

    ϵT2 = erro_relativo(μT2, σT2)
    println("ϵT2 = $ϵT2")
    println("---------------------------------")

    if ϵT1 < 10
        T[index, 2] = μT1
    end

    if ϵT2 < 10
        T[index, 3] = μT2
    end

end

function read_file(path)
    return CSV.read(path, DataFrame; header=1)
end

function main()
    index = 1
    μ = 0.0
    σ = 1.0
    d = Normal(μ, σ)
    

    NS = 100
    NF = 1000
    ΔN = 100
    nr_steps = convert(Int64, ((NF - NS) / ΔN) + 1)

    timings = zeros(nr_steps, 3)

    for N = NS:ΔN:NF
        A = rand(d, N)
        medir_tempo!(A, N, index, timings, 50)
        index += 1
    end

    println(timings)

    plot(timings[:, 1], timings[:, 2] * 70, title="InsertSort vs BubbleSort", label="insertion_sort", lw=3)
    plot!(timings[:, 1], timings[:, 3], label="bubble_sort", lw=3)


    # df = read_file("Aula 1/data.csv")
    # println("Before InsertSort ", df)
    # insertion_sort_d!(df)
    # println("After InsertSort ", df)





end

main()