(_tabela as text) as table =>
    let
        FonteDados = tb_planilhas,
        PlanilhaSelecionada = Table.SelectRows(FonteDados, each [Name] = _tabela),
        _DadosNormalizados_ = Table.Buffer(PlanilhaSelecionada{[
            Item = _tabela,
            Kind = "Sheet"
        ]}[Data])
    in
        _DadosNormalizados_
