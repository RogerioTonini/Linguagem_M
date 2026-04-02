(_tabelaArquivos as table, _listaDeArquivos as text) as table =>
    let
        FonteDados = Table.CombineColumns(
            _tabelaArquivos,
            {"Folder Path", "Name"},
            Combiner.CombineTextByDelimiter("", QuoteStyle.None),
            "Caminho_E_Arquivo"
        ),
        FiltraArquivos = Table.SelectRows(FonteDados, each Text.Contains([Caminho_E_Arquivo], _listaDeArquivos))
    in
        FiltraArquivos
