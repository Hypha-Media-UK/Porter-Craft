document.addEventListener('DOMContentLoaded', function() {
    // Main tab navigation
    const tabs = document.querySelectorAll('.nav-tabs .nav-link');
    tabs.forEach(tab => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Hide all tab panes
            document.querySelectorAll('.tab-pane').forEach(pane => {
                pane.classList.remove('active');
            });
            
            // Deactivate all tabs
            tabs.forEach(t => {
                t.classList.remove('active');
            });
            
            // Activate clicked tab
            this.classList.add('active');
            
            // Show corresponding pane
            const target = this.getAttribute('href');
            document.querySelector(target).classList.add('active');
        });
    });

    // Staff type tabs
    const supervisorsTab = document.getElementById('supervisors-tab');
    const portersTab = document.getElementById('porters-tab');
    const supervisorsSection = document.querySelector('.supervisors-section');
    const portersSection = document.querySelector('.porters-section');
    
    if (supervisorsTab && portersTab) {
        supervisorsTab.addEventListener('click', function() {
            supervisorsTab.classList.add('active');
            portersTab.classList.remove('active');
            supervisorsSection.style.display = 'block';
            portersSection.style.display = 'none';
        });
        
        portersTab.addEventListener('click', function() {
            portersTab.classList.add('active');
            supervisorsTab.classList.remove('active');
            portersSection.style.display = 'block';
            supervisorsSection.style.display = 'none';
        });
    }

    // Add Department buttons
    const addDepartmentButtons = document.querySelectorAll('.add-department-btn');
    addDepartmentButtons.forEach(button => {
        button.addEventListener('click', function() {
            const buildingId = this.getAttribute('data-building-id');
            const form = document.getElementById('department-form-' + buildingId);
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
        });
    });

    // Cancel department form buttons
    const cancelDepartmentButtons = document.querySelectorAll('.inline-department-form .cancel-btn');
    cancelDepartmentButtons.forEach(button => {
        button.addEventListener('click', function() {
            const buildingId = this.getAttribute('data-building-id');
            const form = document.getElementById('department-form-' + buildingId);
            form.style.display = 'none';
        });
    });

    // Add Subcategory buttons
    const addSubcategoryButtons = document.querySelectorAll('.add-subcategory-btn');
    addSubcategoryButtons.forEach(button => {
        button.addEventListener('click', function() {
            const categoryId = this.getAttribute('data-category-id');
            const form = document.getElementById('subcategory-form-' + categoryId);
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
        });
    });

    // Cancel subcategory form buttons
    const cancelSubcategoryButtons = document.querySelectorAll('.inline-subcategory-form .cancel-btn');
    cancelSubcategoryButtons.forEach(button => {
        button.addEventListener('click', function() {
            const categoryId = this.getAttribute('data-category-id');
            const form = document.getElementById('subcategory-form-' + categoryId);
            form.style.display = 'none';
        });
    });

    // Check for URL hash to select appropriate tab
    if (window.location.hash) {
        const hash = window.location.hash;
        const tab = document.querySelector(`.nav-tabs .nav-link[href="${hash}"]`);
        if (tab) {
            tab.click();
        }
    }

    // Check for URL param for staff type
    const urlParams = new URLSearchParams(window.location.search);
    const staffType = urlParams.get('staffType');
    if (staffType === 'porter' && portersTab) {
        portersTab.click();
    }
});
