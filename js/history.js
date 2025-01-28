async function loadHistory() {
    try {
        const response = await fetch(`logic/history-user.php`);
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        const xmlText = await response.text();
        
        // Parse XML
        const parser = new DOMParser();
        const xmlDoc = parser.parseFromString(xmlText, "text/xml");
        
        // Check for parsing errors
        const parserError = xmlDoc.querySelector('parsererror');
        if (parserError) {
            throw new Error('XML parsing error: ' + parserError.textContent);
        }
        
        // Fetch XSL
        const xslResponse = await fetch('history.xsl');
        if (!xslResponse.ok) {
            throw new Error(`HTTP error loading XSL! status: ${xslResponse.status}`);
        }
        
        const xslText = await xslResponse.text();
        const xslDoc = parser.parseFromString(xslText, "text/xml");
        
        // Transform
        const xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xslDoc);
        const resultDocument = xsltProcessor.transformToFragment(xmlDoc, document);
        
        // Update DOM
        const container = document.getElementById('historyContainer');
        container.innerHTML = '';
        container.appendChild(resultDocument);
        
    } catch (error) {
        console.error('Error loading history:', error);
        document.getElementById('historyContainer').innerHTML = 
            `<div class="error">Error loading history: ${error.message}</div>`;
    }
}

document.addEventListener('DOMContentLoaded', loadHistory);
