const mysql = require('../mysql');

exports.getData = async (req, res, next) => {
    try {
        const query = `SELECT c.cid_nome, t.tab_numero_casos, t.tab_confirmados, t.tab_analise, t.tab_obitos 
                       FROM tabela t
                       LEFT OUTER JOIN cidades c ON t.cid_id = c.cid_id
                       order by tab_id;;`;
        const results = await mysql.execute(query);

        if (results.length < 1) {
            return res.status(401).send({
                status: 'error',
                data: "Nenhum dado cadastrado!"
            });
        } else {
            const response = {
                dados: results.map(tab => {
                    return {
                        id: tab.tab_id,
                        cidade: tab.cid_nome,
                        casos: tab.tab_numero_casos,
                        confirmados: tab.tab_confirmados,
                        analise: tab.tab_analise,
                        obitos: tab.tab_obitos,
                        criacao: tab.tab_data_criacao,
                        modificacao: tab.tab_data_modificacao,
                    }
                })
            }
            return res.status(200).send(response);
                
        }

    } catch (error) {
        console.log(error);
        return res.status(500).send({ erro: error });
    }
};

exports.getDataCity = async (req, res, next) => {
    try {
        let name = '';
        if (req.query.name) {
            name = req.query.name;    
        }
    
        const query = `SELECT c.cid_nome, t.tab_numero_casos, t.tab_confirmados, t.tab_analise, t.tab_obitos 
                       FROM tabela t
                       WHERE t.cid_id = ?
                       LEFT OUTER JOIN cidades c ON t.cid_id = c.cid_id
                       order by tab_id;;`;
        const result = await mysql.execute(query, [
            req.query.cidId
        ])
        const response = {
            length: result.length,
            products: result.map(tab => {
                return {
                    id: tab.tab_id,
                    cidade: tab.cid_nome,
                    casos: tab.tab_numero_casos,
                    confirmados: tab.tab_confirmados,
                    analise: tab.tab_analise,
                    obitos: tab.tab_obitos,
                    criacao: tab.tab_data_criacao,
                    modificacao: tab.tab_data_modificacao,
    }
            })
        }
        return res.status(200).send(response);
    } catch (error) {
        return res.status(500).send({ error: error });
    }
};


