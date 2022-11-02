from tkinter import ttk
from tkinter import *
import tkinter as tk

import sqlite3

class Product:
    
    # Conexion a la bd
    db_name = 'database.db'

    def __init__(self, window):
        # Initializations 
        self.wind = window
        self.wind.title('LeMone Gestion de STOCK')

        #######
        # Add Product 
        frame = LabelFrame(self.wind, text = 'Registrar nuevo producto')
        frame.grid(row = 1, column = 0, columnspan = 3, pady = 20)

        # Name Input
        Label(frame, text = 'Nombre: ').grid(row = 1, column = 0)
        self.name = Entry(frame)
        self.name.focus()
        self.name.grid(row = 1, column = 1)

        # Price Input
        Label(frame, text = 'Precio: $').grid(row = 2, column = 0)
        self.price = Entry(frame)
        self.price.grid(row = 2, column = 1)

        # Amount Input
        Label(frame, text = 'Cantidad: ').grid(row = 3, column = 0)
        self.amount = Entry(frame)
        self.amount.grid(row = 3, column = 1)

        # Button Add Product 
        ttk.Button(frame, text = 'Guardar', command = self.add_product).grid(row = 4, columnspan = 3, sticky = W + E)
        #######
        
        #######
        # Buttons
        ttk.Button(text = 'BORRAR', command = self.delete_product).grid(row = 0, column = 3, sticky = W + E)
        ttk.Button(text = 'EDITAR', command = self.edit_product).grid(row = 0, column = 4, sticky = W + E)
        #######
        
        #######
        # Table
        self.tree = ttk.Treeview(height = 10, columns = ('',''))
        self.tree.grid(row = 1, column = 3, columnspan = 2)
        self.tree.heading('#0', text = 'Nombre', anchor = CENTER)
        self.tree.heading('#1', text = 'Precio', anchor = CENTER)
        self.tree.heading('#2', text = 'Cantidad', anchor = CENTER)
        #######
        
        #######
        # Frame Sell
        frame = LabelFrame(self.wind, text = 'Vender producto')
        frame.grid(row = 4, column = 0, columnspan = 3, pady = 20)

        # Name To Sell
        Label(frame, text = 'Nombre: ').grid(row = 5, column = 0)
        self.name_sell = Entry(frame)
        self.name_sell.grid(row = 5, column = 1)

        # Amount To Sell
        Label(frame, text = 'Cantidad: ').grid(row = 6, column = 0)
        self.amount_sell = Entry(frame)
        self.amount_sell.grid(row = 6, column = 1)

        # Button Sell
        ttk.Button(frame, text = 'Vender   =)', command = lambda: self.sell_product(self.name_sell.get(),self.amount_sell.get())).grid(row = 11, columnspan = 3, sticky = W + E)
        #######
        
        #######
        # Frame Search
        frame = LabelFrame(self.wind, text = 'Buscar producto')
        frame.grid(row = 4, column = 3, columnspan = 3, pady = 20)

        # Name To Search
        Label(frame, text = 'Nombre: ').grid(row = 4, column = 3)
        self.name_search = Entry(frame)
        self.name_search.grid(row = 4, column = 1)

        # Button Search
        ttk.Button(frame, text = 'Buscar', command = lambda: self.search_product(self.name_search.get())).grid(row = 5, columnspan = 3, sticky = W + E)
        #######

        #######
        # Frame Stock Min
        frame = LabelFrame(self.wind, text = 'Listar productos con poca cantidad')
        frame.grid(row = 11, columnspan = 3, pady = 20)
        
        # Button Stock Min
        ttk.Button(frame, text = 'Stock minimo', command = lambda: self.stock_min()).grid(row = 12, columnspan = 3, sticky = W + E)
        #######
        
        #######
        # Frame Top 5
        frame = LabelFrame(self.wind, text = 'Top 5 mas vendidos')
        frame.grid(row = 13, columnspan = 3, pady = 20)
        
        # Button Top 5
        ttk.Button(frame, text = 'Top 5', command = lambda: self.top5()).grid(row = 14, columnspan = 3, sticky = W + E)
        #######
        
        #######
        # Output Messages 
        self.message = Label(text = '', fg = 'blue')
        self.message.grid(row = 7, column = 3, columnspan = 3, sticky = W + E)

        # Output Messages Error
        self.message_error = Label(text = '', fg = 'red')
        self.message_error.grid(row = 8, column = 3, columnspan = 3, sticky = W + E)     
        #######

        # Filling the Rows
        self.get_products()

    # Substring
    def substring(self, name_search, cad):
        for i in range(0,len(cad)):
            if (name_search[0] == cad[i]):
                return 1
        return 0
    # CRUD and DB conextion for CRUD in Python 
    # Search Product
    def search_product(self, name_search):
        if name_search != '':
            query = 'SELECT * FROM product ORDER BY name DESC'
            db_rows = self.run_query(query)
            for row in db_rows:
                if(row[1] == name_search or self.substring(name_search, row[1])):
                    self.message['text'] = 'Nombre: '+row[1]+'   Precio: $'+str(row[2])+'   Cantidad: '+str(row[3])
                    return
            self.message['text'] = '{} no esta en la lista'.format(name_search)
        else:
            self.message_error['text'] = 'Escriba un nombre para buscar'
            
    
    # Function to Execute Database Querys
    def run_query(self, query, parameters = ()):
        with sqlite3.connect(self.db_name) as conn:
            cursor = conn.cursor()
            result = cursor.execute(query, parameters)
            conn.commit()
        return result

    # Get Products from Database
    def get_products(self):
        # cleaning Table 
        records = self.tree.get_children()
        for element in records:
            self.tree.delete(element)
        # getting data
        query = 'SELECT * FROM product ORDER BY name DESC'
        db_rows = self.run_query(query)
        # filling data
        for row in db_rows:
            self.tree.insert('', 0, text = row[1], values = (row[2],row[3]))

    # User Input Validation
    def validation(self):
        return (len(self.name.get()) != 0 and len(self.price.get()) != 0 and len(self.amount.get()) != 0)

    def add_product(self):
        if self.validation():
            query = 'INSERT INTO product VALUES(NULL, ?, ?, ?, ?)'
            parameters =  (self.name.get(), self.price.get(), self.amount.get(), 0)
            self.run_query(query, parameters)
            self.message['text'] = 'El producto {} se agrego correctamente'.format(self.name.get())
            self.name.delete(0, END)
            self.price.delete(0, END)
            self.amount.delete(0, END)
        else:
            self.message_error['text'] = 'Todos los campos son requeridos'
        self.get_products()

    def delete_product(self):
        self.message['text'] = ''
        try:
           self.tree.item(self.tree.selection())['text'][0]
        except IndexError as e:
            self.message_error['text'] = 'Seleccione un producto'
            return
        self.message['text'] = ''
        name = self.tree.item(self.tree.selection())['text']
        query = 'DELETE FROM product WHERE name = ?'
        self.run_query(query, (name, ))
        self.message['text'] = 'El producto {} fue eliminado'.format(name)
        self.get_products()

    def edit_product(self):
        self.message['text'] = ''
        try:
            self.tree.item(self.tree.selection())['values'][0]
        except IndexError as e:
            self.message_error['text'] = 'Seleccione un producto'
            return
        name = self.tree.item(self.tree.selection())['text']
        old_price = self.tree.item(self.tree.selection())['values'][0]
        old_amount = self.tree.item(self.tree.selection())['values'][1]
        self.edit_wind = Toplevel()
        self.edit_wind.title = 'Editar producto'
        # Old Name
        Label(self.edit_wind, text = 'Nombre viejo:').grid(row = 0, column = 1)
        Entry(self.edit_wind, textvariable = StringVar(self.edit_wind, value = name), state = 'readonly').grid(row = 0, column = 2)
        # New Name
        Label(self.edit_wind, text = 'Nombre nuevo:').grid(row = 1, column = 1)
        new_name = Entry(self.edit_wind)
        new_name.grid(row = 1, column = 2)

        # Old Price 
        Label(self.edit_wind, text = 'Precio viejo:').grid(row = 2, column = 1)
        Entry(self.edit_wind, textvariable = StringVar(self.edit_wind, value = old_price), state = 'readonly').grid(row = 2, column = 2)
        # New Price
        Label(self.edit_wind, text = 'Precio nuevo:').grid(row = 3, column = 1)
        new_price = Entry(self.edit_wind)
        new_price.grid(row = 3, column = 2)

        # Old Amount 
        Label(self.edit_wind, text = 'Cantidad vieja:').grid(row = 4, column = 1)
        Entry(self.edit_wind, textvariable = StringVar(self.edit_wind, value = old_amount), state = 'readonly').grid(row = 4, column = 2)
        # New Amount
        Label(self.edit_wind, text = 'Cantidad nueva:').grid(row = 5, column = 1)
        new_amount = Entry(self.edit_wind)
        new_amount.grid(row = 5, column = 2)

        Button(self.edit_wind, text = 'Actualizar', command = lambda: self.edit_records(new_name.get(), name, new_price.get(), old_price, new_amount.get(), old_amount)).grid(row = 6, column = 2, sticky = W)
        self.edit_wind.mainloop()

    def edit_records(self, new_name, name, new_price, old_price, new_amount, old_amount):
        if(new_name == ""):
            new_name = name
        if(new_price == ""):
            new_price = old_price
        if(new_amount == ""):
            new_amount = old_amount
        query = 'UPDATE product SET name = ?, price = ?, amount = ? WHERE name = ? AND price = ? AND amount = ?'
        parameters = (new_name, new_price, new_amount, name, old_price, old_amount)
        self.run_query(query, parameters)
        self.edit_wind.destroy()
        self.message['text'] = 'El producto {} se modifico correctamente'.format(name)
        self.get_products()

    # Sell Product
    def sell_product(self, name_sell, cantidad):
        if (cantidad == ""):
            cantidad = "1"
        if (name_sell != ''):
            query = 'SELECT * FROM product ORDER BY name DESC'
            db_rows = self.run_query(query)
            for row in db_rows:
                    if(row[1] == name_sell):
                        if (row[3] == 0):
                            self.message_error['text'] = 'No hay stock de {} para vender !'.format(name_sell)
                            return
                        else:
                            db_rows.close()
                            query2 = 'UPDATE product SET name = ?, amount = ?, sell = ? WHERE name = ? AND amount = ? AND sell = ?'
                            parameters = (name_sell, row[3] - int(cantidad), row[4] + int(cantidad), name_sell, row[3], row[4])
                            self.run_query(query2, parameters)
                            self.message['text'] = 'El producto {} se modifico correctamente'.format(name_sell)
                            self.get_products()
                            return
            self.message['text'] = '{} no esta en la lista'.format(name_sell)
        else:
            self.message_error['text'] = 'Escriba un nombre para vender'

    # Stock Min 
    def stock_min(self):
        MINIMO = 2
        lista_cantidades = []
        query = 'SELECT * FROM product ORDER BY name DESC'
        db_rows = self.run_query(query)
        for row in db_rows:
            if(row[3] <= MINIMO):
                lista_cantidades = lista_cantidades + [row[1]]
        if(lista_cantidades != []):
            self.message['text'] = 'Productos con poca cantidad: {}'.format(lista_cantidades)
        else:
            self.message['text'] = 'No hay productos con poca cantidad !'

    # Top 5
    def top5(self):
        lista_cant = []
        lista_vendidos = []
        lista_obj = []
        query = 'SELECT * FROM product ORDER BY name DESC'
        db_rows = self.run_query(query)
        for row in db_rows:
            if(row[4] >= 1):
                if(len(lista_vendidos) < 5):
                    lista_obj = lista_obj + [row] 
                    lista_vendidos = lista_vendidos + [row[1]]
                    lista_cant = lista_cant + [row[4]]
                else:
                    minimo = min(lista_cant)
                    for i in range(0,5):
                        if(minimo == lista_obj[i][4] and row[4] > lista_obj[i][4] and row not in lista_obj):
                            lista_obj[i] = row
                            lista_vendidos[i] = row[1]
                            lista_cant[i] = row[4]
                            i=5
        if(len(lista_vendidos) == 5):
            self.message['text'] = '5 productos mas vendidos: {}'.format(lista_vendidos)
        else:
            self.message['text'] = 'Todavia no se vendieron 5 productos'


if __name__ == '__main__':
    window = Tk()
    application = Product(window)
    window.mainloop()
