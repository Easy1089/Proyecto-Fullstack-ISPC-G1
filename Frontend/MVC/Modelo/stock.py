# Controlador con manejo de datos con python ejemplo tomado del demo de CRUD en python del sprint 2.

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

    
