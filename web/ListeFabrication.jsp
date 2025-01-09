<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="ListeFabrication.css">
    <title>Formulaire avec Table</title>
    <style>
        
    </style>
</head>
<body>
    <div class="container">
        <h1>Formulaire</h1>
        <form>
            <div class="form-group">
                <label for="select1">Choisissez une option :</label>
                <select id="select1" name="option1">
                    <option value="">-- Sélectionnez --</option>
                    <option value="option1">Option 1</option>
                    <option value="option2">Option 2</option>
                    <option value="option3">Option 3</option>
                </select>
            </div>

            <div class="form-group">
                <label for="select2">Choisissez une autre option :</label>
                <select id="select2" name="option2">
                    <option value="">-- Sélectionnez --</option>
                    <option value="optionA">Option A</option>
                    <option value="optionB">Option B</option>
                    <option value="optionC">Option C</option>
                </select>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nom</th>
                        <th>Valeur</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Exemple 1</td>
                        <td>Valeur 1</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Exemple 2</td>
                        <td>Valeur 2</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Exemple 3</td>
                        <td>Valeur 3</td>
                    </tr>
                </tbody>
            </table>

            <button type="submit" class="submit-btn">Soumettre</button>
        </form>
    </div>
</body>
</html>