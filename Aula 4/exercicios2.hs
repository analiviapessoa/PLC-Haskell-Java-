type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

baseExemplo :: BancoDados
baseExemplo =[("Sergio","O Senhor dos Aneis"),
            ("Andre","Duna"),
            ("Fernando","Jonathan Strange & Mr.Norrell"),
            ("Fernando","Duna")]
-- livros emprestados

livros :: BancoDados -> Pessoa -> [Livro]
livros bd p = [ll | (pp,ll) <- bd, pp == p]
--livros [] p = []
--livros ((p1,l1):as) p | p == p1 = l1 : livros bd p

emprestimos :: BancoDados -> Livro ->[Pessoa]
emprestimos bd l = [p | (p,ll) <- bd, l == ll]
--emprestimos [] l = []
--emprestimos ((p1,l1):as) l | l == l1 = p1 : emprestimos bd lp

emprestado :: BancoDados -> Livro -> Bool
emprestado bd l = (emprestimos bd l) /= []

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos bd p = length(livros bd p)

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
-- emprestar [] pessoa livro = [(p,l)]
-- emprestar ((p,l):as) pessoa livro 
--     | p == pessoa && l == livro = ((p,l):as)
--     | otherwise                 = ((p,l): emprestar as pessoa livro)
--emprestar bd p l = [(p,l)] ++ bd
emprestar bd p l = (p,l):bd

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
--devolver bd p l = [(p1,l1) | (p1,l1) <- bd, (p1,l1) /= (p,l)]
devolver [] p l = []
devolver ((p1,l1):as) p l | (p1,l1) == (p,l) = as
                        | otherwise = (p1,l1) : devolver bd p l