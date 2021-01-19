import numpy as np
import joblib
import os
from sklearn.neural_network import MLPClassifier
from flask import Flask, request, jsonify, render_template

app = Flask(__name__)

def previsao_diabetes(lista_valores_formulario):
    print(lista_valores_formulario)
    lista_valores = np.array(lista_valores_formulario)
    print(lista_valores)
    prever = lista_valores.reshape(1,8)
    print(prever)
    #print(__file__)
    #dirname = os.path.abspath(os.path.dirname(__file__))
    #print(dirname)
    #filename = dirname + '\melhor_modelo.sav'
    #modelo_salvo = joblib.load(filename)
    modelo_salvo = joblib.load('melhor_modelo.sav')
    resultado = modelo_salvo.predict(prever)
    return resultado[0]

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/result',methods=['POST'])
def result():
    if request.method == 'POST':
        lista_formulario = request.form.to_dict()
        lista_formulario = list(lista_formulario.values())
        lista_formulario = list(map(float,lista_formulario))
        resultado = previsao_diabetes(lista_formulario)
        if int(resultado) == 1:
            previsao = 'Possui diabetes'
        else:
            previsao = 'Não possui diabetes'

        #retorna resultado para uma página html
        return render_template('resultado.html',previsao=previsao)

if __name__ == "__main__":
   app.run(port=5400, debug=True)