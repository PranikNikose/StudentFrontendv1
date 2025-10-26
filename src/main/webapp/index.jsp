<h2>Welcome to Candidate Frontend</h2>

<!-- Candidate List -->
<div id="candidates">Loading candidates...</div>

<!-- Form to add a new candidate -->
<h3 style="margin-bottom: 10px;">Add New Candidate</h3>

<form id="candidateForm"
	style="border: 1px solid #ccc; padding: 15px; width: 300px; border-radius: 5px; background-color: #f9f9f9;">
	<div style="margin-bottom: 10px;">
		<label for="name" style="display: block; margin-bottom: 5px;">Name:</label>
		<input type="text" id="name" required
			style="width: 100%; padding: 5px;" />
	</div>

	<div style="margin-bottom: 10px;">
		<label for="email" style="display: block; margin-bottom: 5px;">Email:</label>
		<input type="email" id="email" required
			style="width: 100%; padding: 5px;" />
	</div>

	<button type="submit"
		style="padding: 7px 15px; background-color: #4CAF50; color: white; border: none; border-radius: 3px; cursor: pointer;">
		Save</button>
</form>

<script>
async function loadCandidates() {
    try {
        const res = await fetch('http://localhost:8080/api/get');
        const data = await res.json();

        if (data.length === 0) {
            document.getElementById('candidates').innerHTML = 'No candidates found.';
            return;
        }

        let html = '<ul>';
        data.forEach(c => {
            html += '<li>' + c.id + ' - ' + c.name + ' - ' + c.email + '</li>';
        });
        html += '</ul>';
        document.getElementById('candidates').innerHTML = html;

    } catch (err) {
        document.getElementById('candidates').innerHTML = 'Error fetching candidates: ' + err.message;
        console.error(err);
    }
}

// Call to load candidates on page load
loadCandidates();

// Handle form submission
document.getElementById('candidateForm').addEventListener('submit', async function(e) {
    e.preventDefault(); // Prevent page refresh

    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;

    const newCandidate = {
        name: name,
        email: email
    };

    try {
        const res = await fetch('http://localhost:8080/api/add', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(newCandidate)
        });

        const text = await res.text(); // backend returns a string message
        alert(text); // show success message

        // Reset form
        document.getElementById('candidateForm').reset();

        // Reload candidates
        loadCandidates();

    } catch (err) {
        alert('Error saving candidate: ' + err.message);
        console.error(err);
    }
});
</script>

<a href="registration.action">Go to Registration Page</a>