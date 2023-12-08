const con = require('./connection');
const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.set('view engine', 'ejs');
app.use('/public', express.static('public'));

con.connect((err) => {
    if (err) {
        console.error('Error connecting to database:', err);
        return;
    }
    console.log('Connected to MySQL database');

    app.get('/', (req, res) => {
        res.render('home.ejs')
    });

    app.get('/ngo', (req, res) => {
        con.query('SELECT `Sr No.`, `Name of VO/NGO`, `Registration No.,City & State`, `Address`, `Sectors working in` FROM ngo_dir', (err, rows) => {
            if (err) {
                console.error('Error fetching data:', err);
                res.status(500).json({ error: 'Internal Server Error' });
                return;
            }
            res.render('ngo', { data: rows });
        });
    });


    app.get('/ngo-search', (req, res) => {
        const searchQuery = req.query.search;
        const sql = `SELECT * FROM ngo_dir WHERE \`Name of VO/NGO\` LIKE '%${searchQuery}%'`;
    
        con.query(sql, (err, rows) => {
            if (err) {
                console.error('Error searching data:', err);
                res.status(500).json({ error: 'Internal Server Error' });
                return;
            }
            res.render('ngo', { data: rows });
        });
    });
    
// contact us form 
app.post('/submit-contactus', (req, res) => {
    const { name, email, subject, message } = req.body;

    const sql = 'INSERT INTO contact_us (name, mail, subject, message) VALUES (?, ?, ?, ?)';
    con.query(sql, [name, email, subject, message], (err, result) => {
        if (err) {
            console.error('Error storing data:', err);
            res.status(500).json({ error: 'Internal Server Error' });
            return;
        }
        res.status(200).json({ message: 'Data stored successfully' });
    });
});

// admin login 
app.get('/adminLogin',(req,res)=>{
    res.render('adminLogin.ejs')
})
app.post('/admin-login', (req, res) => {
    const { email, password } = req.body;

    const sql = 'SELECT * FROM admin WHERE mail = ? AND password = ?';
    con.query(sql, [email, password], (err, result) => {
        if (err) {
            console.error('Error verifying admin credentials:', err);
            res.status(500).json({ error: 'Internal Server Error' });
            return;
        }
        if (result.length > 0) {
            // Admin login successful
           res.redirect('/admin_page');
        } else {
            // Admin login failed
            res.status(401).json({ error: 'Invalid credentials' });
        }
    });
});

//user 
app.get('/user_reg',(req,res)=>{
    res.render('user_reg.ejs')
})
//login
app.get('/login',(req,res)=>{
    res.render('login.ejs');
})

// Assuming you have established your MySQL connection
// Replace 'con' with your connection object

app.post('/u_login', (req, res) => {
    const { mail, password } = req.body;
  console.log(req.body)
    const query = 'SELECT * FROM users WHERE mail = ?';
  
    con.query(query, [mail], (err, results) => {
      if (err) {
        console.error('Error retrieving data:', err);
        res.status(500).send('Error retrieving data from the database');
        return;
      }
  
      if (results.length === 1) {
        const user = results[0];
  
        if (user.password === password) {
          // Passwords match, redirect to home page or wherever needed
          res.redirect('/');
        } else {
          // Passwords don't match
          res.status(401).send('Invalid email or password');
        }
      } else {
        // User with that email not found
        res.status(401).send('Invalid email or password');
      }
    });
  });
  


app.post('/user_reg', (req, res) => {
    const { fullName, username, email, phonenumber, password, gender } = req.body;
  
    const insertQuery = 'INSERT INTO users (name, username, mail, mob, password, gender) VALUES (?, ?, ?, ?, ?, ?)';
    
    con.query(insertQuery, [fullName, username, email, phonenumber, password, gender], (err, result) => {
      if (err) {
        console.error('Error inserting data:', err);
        res.status(500).send('Error saving data to the database');
        return;
      }

      //res.status(200).send('Data inserted successfully!');
      res.redirect('/login');
    });
  });

// admin page
app.get('/admin_page',(req,res)=>{
    res.render('admin_page.ejs');
})


app.get('/contacted_users', (req, res) => {
    const sql = 'SELECT * FROM contact_us';
    con.query(sql, (err, result) => {
        if (err) {
            console.error('Error fetching contacted users:', err);
            res.status(500).json({ error: 'Internal Server Error' });
            return;
        }
        res.render('contacted_users', { data: result });
    });
});

app.post('/delete-contact', (req, res) => {
    const email = req.body.email;
    const sql = 'DELETE FROM contact_us WHERE mail = ?';
    con.query(sql, [email], (err, result) => {
        if (err) {
            console.error('Error deleting contacted user:', err);
            res.status(500).json({ error: 'Internal Server Error' });
            return;
        }
        res.redirect('/contacted_users');
    });
});


//donor registration 
app.get('/donor_reg',(req,res)=>{
    res.render('donor_reg.ejs');
})

app.post('/donor_reg', (req, res) => {
    const { name, gender, email, phone, address, ngoName, donationtype } = req.body;
  
    const insertQuery = 'INSERT INTO donor (name, gender, mail, mob, address, name_of_ngo, type_of_donation) VALUES (?, ?, ?, ?, ?, ?, ?)';
    
    con.query(insertQuery, [name, gender, email, phone, address, ngoName, donationtype], (err, result) => {
      if (err) {
        console.error('Error inserting data:', err);
        res.status(500).send('Error saving data to the database');
        return;
      }
      console.log('Data inserted successfully!');
      res.status(200).send('Data inserted successfully!');
    });
  });
  

  // donor

  app.get('/display_donor', (req, res) => {
    const selectQuery = 'SELECT * FROM donor';
    
    con.query(selectQuery, (err, result) => {
      if (err) {
        console.error('Error fetching data:', err);
        res.status(500).send('Error fetching data from the database');
        return;
      }
  
      if (result.length > 0) {
        const data = result; // Use the entire result set
        res.render('display_donor', { data }); // Renders 'display_donor.ejs' with the data
      } else {
        res.status(404).send('No donor data found');
      }
    });
  });
  


    const PORT = process.env.PORT || 4500;
    app.listen(PORT, () => {
        console.log(`Server running on port ${PORT}`);
    });
});
